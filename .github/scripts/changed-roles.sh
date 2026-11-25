#!/usr/bin/env bash
# Print, as a JSON array, the roles to test for the changes between BASE and HEAD.
set -euo pipefail

shared='^(\.github/(workflows/test-roles?\.ya?ml|scripts/changed-roles\.sh)|devbox\.(json|lock)|flake\.(nix|lock)|Taskfile\.yml|requirements\.yml|\.pre-commit-config\.yaml)$'

base="${1:-}"
all_roles=$(find roles -mindepth 2 -maxdepth 2 -name molecule -type d | cut -d/ -f2 | sort)

if [ -z "$base" ] || [ "$base" = "0000000000000000000000000000000000000000" ] \
  || ! git cat-file -e "${base}^{commit}" 2>/dev/null; then
  roles="$all_roles"
else
  # --no-renames: a file moved between roles changes both of them.
  # -z: paths are printed unquoted.
  changed=$(git diff -z --no-renames --name-only "$base" HEAD | tr '\0' '\n')
  if grep -qE "$shared" <<<"$changed"; then
    roles="$all_roles"
  else
    roles=$(comm -12 <(grep -E '^roles/[^/]+/' <<<"$changed" | cut -d/ -f2 | sort -u) \
      <(echo "$all_roles"))
  fi
fi

jq -cnR '[inputs | select(length > 0)]' <<<"$roles"
