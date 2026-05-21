#!/bin/bash

# ==========================================
# Hexagonal Architecture Folder Setup
# ==========================================

# PROJECT_NAME="my-app"

# echo "Creating project structure for: $PROJECT_NAME"

# # Create Root Project Folder
# mkdir -p $PROJECT_NAME

# cd $PROJECT_NAME || exit

# ==========================================
# Create Main Folder Structure
# ==========================================

mkdir -p src/core/domain/entities
mkdir -p src/core/domain/repositories
mkdir -p src/core/domain/services

mkdir -p src/core/application/usecases
mkdir -p src/core/application/dto

mkdir -p src/core/ports/input
mkdir -p src/core/ports/output

mkdir -p src/infrastructure/database
mkdir -p src/infrastructure/repositories
mkdir -p src/infrastructure/config
mkdir -p src/infrastructure/logger

mkdir -p src/adapters/controllers
mkdir -p src/adapters/routes
mkdir -p src/adapters/middlewares

mkdir -p src/shared/constants
mkdir -p src/shared/utils
mkdir -p src/shared/errors

mkdir -p tests

# ==========================================
# Create Base Files
# ==========================================

touch src/app.ts
touch src/server.ts

touch .env
touch package.json
touch tsconfig.json
touch nodemon.json
touch .gitignore

# ==========================================
# Create Optional README
# ==========================================

cat > README.md <<EOF
# Hexagonal Architecture Node.js Project

## Run Project

\`\`\`bash
npm install
npm run dev
\`\`\`

## Folder Structure

- core → Business Logic
- infrastructure → External Services
- adapters → Controllers & Routes
- shared → Common Utilities
EOF

# ==========================================
# Done
# ==========================================

echo ""
echo "======================================"
echo " Hexagonal Structure Created Successfully"
echo "======================================"
echo ""

tree . 2>/dev/null || find .

echo ""