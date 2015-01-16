# Install Chocolatey first
# These packages are in a seperate file because they require
# intervention to complete installation.
choco install `
docker                                 , # Requires drivers acceptance
pdfsam.install                         , # Clicks for installing javaruntime required
pnggauntlet                              # Clicks required
