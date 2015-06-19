#!/usr/bin/env bats

@test "Bats 0.4.0 installed" {
  run bats --version
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "Bats 0.4.0" ]

}