{ pkgs, lib, config, inputs, ... }:

{
  packages = [
    pkgs.ansible
    pkgs.ansible-doctor
    pkgs.git
    pkgs.pre-commit
    pkgs.python312Packages.kubernetes
    pkgs.python312Packages.molecule
    pkgs.python312Packages.molecule-plugins
 ];

  languages.ansible.enable = true;
  enterShell = ''
    export ANSIBLE_ROLES_PATH=$PWD/.devenv/ansible/roles;
    export ANSIBLE_COLLECTIONS_PATH=$PWD/.devenv/ansible/collections;

    mkdir -p $ANSIBLE_ROLES_PATH
    mkdir -p $ANSIBLE_COLLECTIONS_PATH
  '';
}
