run "setup" {
  command   = apply
  state_key = "main"
  module {
    source = "./.."
  }
}

run "to_display_name_assertions" {
  state_key = "main"
  assert {
    condition     = output.to_display_name["eastus"] == "East US"
    error_message = "Display name mapping for eastus is incorrect"
  }
  assert {
    condition     = output.to_display_name["westus"] == "West US"
    error_message = "Display name mapping for westus is incorrect"
  }
  assert {
    condition     = output.to_display_name["westeurope"] == "West Europe"
    error_message = "Display name mapping for westeurope is incorrect"
  }
}

run "to_fixed_assertions" {
  state_key = "main"
  assert {
    condition     = output.to_fixed["eastus"] == "eu1"
    error_message = "Fixed mapping for eastus is incorrect"
  }
  assert {
    condition     = output.to_fixed["westus"] == "wu1"
    error_message = "Fixed mapping for westus is incorrect"
  }
  assert {
    condition     = output.to_fixed["westeurope"] == "we1"
    error_message = "Fixed mapping for westeurope is incorrect"
  }
}

run "to_short_assertions" {
  state_key = "main"
  assert {
    condition     = output.to_short["eastus"] == "eus1"
    error_message = "Short mapping for eastus is incorrect"
  }
  assert {
    condition     = output.to_short["westus"] == "wus1"
    error_message = "Short mapping for westus is incorrect"
  }
  assert {
    condition     = output.to_short["westeurope"] == "weu1"
    error_message = "Short mapping for westeurope is incorrect"
  }
}

run "from_fixed_assertions" {
  state_key = "main"
  # Test reverse mappings from fixed codes
  assert {
    condition     = output.from_fixed["eu1"] == "eastus"
    error_message = "Reverse fixed mapping for eu1 is incorrect"
  }
  assert {
    condition     = output.from_fixed["wu1"] == "westus"
    error_message = "Reverse fixed mapping for wu1 is incorrect"
  }
  assert {
    condition     = output.from_fixed["we1"] == "westeurope"
    error_message = "Reverse fixed mapping for we1 is incorrect"
  }
}

run "from_short_assertions" {
  state_key = "main"
  assert {
    condition     = output.from_short["eus1"] == "eastus"
    error_message = "Reverse short mapping for eus1 is incorrect"
  }
  assert {
    condition     = output.from_short["wus1"] == "westus"
    error_message = "Reverse short mapping for wus1 is incorrect"
  }
  assert {
    condition     = output.from_short["weu1"] == "westeurope"
    error_message = "Reverse short mapping for weu1 is incorrect"
  }
}
