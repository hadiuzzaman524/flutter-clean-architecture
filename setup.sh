#!/bin/bash
git config core.hooksPath scripts/git-hooks
chmod +x scripts/git-hooks/*
chmod +x l10n_generator.sh
chmod +x create_feature.sh
echo "✅ Git hooks and l10n configured!"