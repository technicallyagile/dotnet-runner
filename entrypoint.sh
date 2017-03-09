#!/bin/bash

cd /project/target

dotnet test --filter "FullyQualifiedName=$@" --verbosity="quiet"
