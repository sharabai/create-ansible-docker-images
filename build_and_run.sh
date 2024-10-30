#!/bin/bash
set -euo pipefail

build_and_run() {
    local version=$1
    local playbook=$2
    local tag="sharaba/ansible:${version}"

    echo "Building Docker image for Ansible ${version}..."
    docker build -f "$(dirname "$0")/Dockerfile" --build-arg ANSIBLE_VERSION=${version} -t ${tag} "$(dirname "$0")"

    echo "Running Docker container with Ansible ${version}..."
    docker run --rm -d \
        --network host \
        -v "$(pwd):/ansible/playbooks" \
        "${tag}" "${playbook}"
}

main() {
    if [[ "$#" -lt 1 ]]; then
        echo "Usage: $0 <playbook>" >&2
        exit 1
    fi

    local playbook=$1

    build_and_run "2.14.13" "$playbook"
    build_and_run "2.16.2"  "$playbook"
}

main "$@"
