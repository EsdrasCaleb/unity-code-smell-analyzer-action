# Unity Code Smell Analyzer Action

This GitHub Action runs the [UnityCodeSmellAnalyzer](https://github.com/MatteoBosco89/UnityCodeSmellAnalyzer) on Unity projects. It checks for code smells in your Unity project and fails the build if any are found.

## Usage

To use this action in your repository, add the following to your workflow YAML file:

```yaml
name: Unity Code Smell Analysis

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main

jobs:
  code-smell-analysis:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Run Unity Code Smell Analyzer
      uses: esdrascaleb/unity-code-smell-analyzer-action@v1
      with:
        unity_project_name: 'YourUnityProjectName' # Optional, defaults to repository name
```

## Inputs
unity_project_name: (Optional) The name of the Unity project solution file (.sln). If not provided, the repository name is used.
License
This project is licensed under the MIT License.

## Credits
Developed by Esdras Caleb. Special thanks to Matteo Bosco for creating the UnityCodeSmellAnalyzer, and Geto (AI Assistant) for contribution in the creation of this action.