#!/usr/bin/env bats

@test "confd 0.10.0 installed" {
  run confd --version
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "confd 0.10.0" ]
}