const fs = require('fs').promises; // Use promises for async operations
const path = require('path');

// Function to generate a timestamped folder name
export async function getReportFolder(baseDir, maxReports = process.env.MAX_REPORTS || 10) {
  const timestamp = new Date().toISOString().replace(/[:.]/g, '-');
  const folder = path.join(baseDir, `LMSreport-${timestamp}`);
  await cleanupOldReports(baseDir, maxReports); // Keep only the specified number of reports
  await fs.mkdir(folder, { recursive: true }); // Create the new report folder
  return folder;
}

// Function to clean up old reports
async function cleanupOldReports(baseDir, maxReports) {
  try {
    // Ensure the base directory exists
    await fs.mkdir(baseDir, { recursive: true });

    const folders = await fs.readdir(baseDir);
    const folderStats = await Promise.all(
      folders.map(async (name) => {
        const folderPath = path.join(baseDir, name);
        const stat = await fs.stat(folderPath);
        return { name, time: stat.mtime.getTime() };
      })
    );

    // Sort by modification time (newest first)
    folderStats.sort((a, b) => b.time - a.time);
    const sortedFolders = folderStats.map(folder => folder.name);

    // Remove old folders if they exceed the maxReports limit
    if (sortedFolders.length > maxReports) {
      const oldFolders = sortedFolders.slice(maxReports);
      await Promise.all(oldFolders.map(async (folder) => {
        await fs.rm(path.join(baseDir, folder), { recursive: true, force: true });
      }));
    }
  } catch (error) {
    console.error('Error cleaning up old reports:', error);
  }
}