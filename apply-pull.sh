# Exit immediately if a command exits with a non-zero status.
set -e

echo "Running terraform apply..."
# The -auto-approve flag skips interactive approval. Use with caution.
# Remove -auto-approve if you want to review the plan before applying.
terraform apply -auto-approve

echo "Pulling latest changes from remote..."
git pull

echo "Done."