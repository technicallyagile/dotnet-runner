#!/bin/bash

cp -a /project/answer/. /project/target

cd /project/target

dotnet test --filter "FullyQualifiedName=$@" --verbosity="quiet"
