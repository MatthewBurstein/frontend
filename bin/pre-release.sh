#!/bin/sh
set -e

npm run build:package

ALL_PACKAGE_VERSION=$(node -p "require('./package/package.json').version")
TAG="v$ALL_PACKAGE_VERSION"
CURRENT_BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)

if [ $(git tag -l "$TAG") ]; then
    echo "⚠️ Git tag already exists."
    exit 1;
else
    echo "Push to a release branch"
    git add .
    git commit -m "Release $TAG"
    #set upstream so that we can push the branch up
    git push --set-upstream origin $CURRENT_BRANCH_NAME
    git push
    echo "🗒 All done. Ready to create a pull request. Once approved, run npm run release"
fi