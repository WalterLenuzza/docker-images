#!/usr/bin/env bats

@test "Bash installed" {
  run apk info -eq bash
  [ "$status" -eq 0 ]
}

@test "Bats installed" {
  run apk info -eq bats
  [ "$status" -eq 0 ]
}

@test "Bind-tools installed" {
  run apk info -eq bind-tools
  [ "$status" -eq 0 ]
}

@test "Caddy installed" {
  run apk info -eq caddy
  [ "$status" -eq 0 ]
}

@test "cURL installed" {
  run apk info -eq curl
  [ "$status" -eq 0 ]
}

@test "Tini installed" {
  run apk info -eq tini
  [ "$status" -eq 0 ]
}
