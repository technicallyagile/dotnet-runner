# dotnet-runner

This standalone runner works with a .Net Core C#/F# Test Project (MSTest/xUnit).

First, this runner installs all dependencies using `dotnet restore`.

At each play, it copies the user's answer and runs the project using `dotnet test` and the specified testcase `--filter "FullyQualifiedName=$@"`. 


# How to Use

To use this runner for your project, edit the `codingame.yml` file and add the following lines to your project:

    runner:
      name: codingame/dotnet-runner
      version: 1.1.0-dotnet-1.1-sdk-msbuild

## Example

**A Git repository example**

```
.
├── about.md
├── codingame.yml
├── markdowns
│   └── <YOUR_LESSONS>.md
└── projects
    └── example              #Your project root
        ├── Example.cs       #Your UnitTest Class
        ├── Example.csproj 
        └── Exercises
            ├── Exercise1.cs #The stub provided to the user
            └── <MORE_EXERCISES>.cs
```

**In your CS project:**

*Example.cs*
```cs
﻿using Answer;
using Newtonsoft.Json.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;

namespace CodinGame
{
    [TestClass]
    public class Example
    {
        [TestMethod]
        public void VerifySum() {
            Assert.AreEqual (0,   Exercise1.DoSum (0, 0));
            /* [...] */
        }
    }
}
```

*Exercise1.cs*
```cs
﻿using System;
namespace Anwser
{
	public class Exercise1 {
		/**
		 * This function should return the sum between a and b
		 **/
		public static int DoSum(int a, int b){
			return 1;
		}
	}
}
```

**In your lesson:**
```md
@[Fix the following code so that the function DoSum returns a sum of integer]({"stubs": ["Exercises/Exercise1.cs"],"command": "CodinGame.Example.VerifySum"})
```

# Technologies

| Technology    |     Version     |
| ------------- | --------------- |
| **.Net Core**      |      [1.1.0-sdk-msbuild-rc4](https://www.microsoft.com/net/core#dockercmd)      |
