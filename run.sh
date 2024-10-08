#!/bin/bash

# Set Unity project name (from input or use repository name as fallback)
if [ -z "$INPUT_UNITY_PROJECT_NAME" ]; then
  UNITY_PROJECT_NAME=$(basename "$GITHUB_REPOSITORY")
else
  UNITY_PROJECT_NAME=$INPUT_UNITY_PROJECT_NAME
fi

# Build the Unity project solution from the root of the repository
dotnet build ./${UNITY_PROJECT_NAME}.sln

# Run UnityCodeSmellAnalyzer
cd /UnityCodeSmellAnalyzer
dotnet run -- analyze --solution /github/workspace/${UNITY_PROJECT_NAME}.sln

# Check if any code smells were found
if [ -s UnityCodeSmellAnalyzerResults.txt ]; then
  echo "Code smells found!"
  cat UnityCodeSmellAnalyzerResults.txt
  exit 1
else
  echo "No code smells detected."
fi
