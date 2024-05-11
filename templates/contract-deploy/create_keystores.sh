# zkEVM/CDK Keystore Creation Script

This Bash script generates keystores for zkEVM/CDK node components, including the sequencer, aggregator, claim transaction manager, and more.

## Overview

The script defines a function, `create_geth_keystore`, which creates encrypted keystores for zkEVM node components. Each keystore is generated using the associated private key and password provided as parameters.

### Prerequisites

- Ensure that the `polycli` utility is installed and available in your `PATH`.

## Script Details

### `create_geth_keystore` Function

This function creates a keystore for a specific zkEVM component.

- **Parameters:**
    - `keystore_name`: The name to assign to the generated keystore file.
    - `private_key`: The private key in hexadecimal format.
    - `password`: The password to encrypt the keystore.

- **Execution Steps:**
    1. Create a temporary directory to hold the keystore during generation.
    2. Use the `polycli` tool to generate the keystore with the provided parameters.
    3. Move the generated file to the desired output directory.
    4. Format the output file using `jq` to ensure proper JSON formatting.
    5. Adjust file permissions to make it readable.
    6. Clean up the temporary directory.

```bash
create_geth_keystore() {
    local keystore_name="$1"
    local private_key="$2"
    local password="$3"

    temp_dir="/tmp/$keystore_name"
    output_dir="/opt/zkevm"
    mkdir -p "$temp_dir"
    polycli parseethwallet --hexkey "$private_key" --password "$password" --keystore "$temp_dir"
    mv "$temp_dir"/UTC* "$output_dir/$keystore_name"
    jq < "$output_dir/$keystore_name" > "$output_dir/$keystore_name.new"
    mv "$output_dir/$keystore_name.new" "$output_dir/$keystore_name"
    chmod a+r "$output_dir/$keystore_name"
    rm -rf "$temp_dir"
}

# Creating Keystores

The script calls create_geth_keystore for each zkEVM component, passing in the specific private key and password. Below are the keystore generation commands:

create_geth_keystore "sequencer.keystore"       "{{.zkevm_l2_sequencer_private_key}}"       "{{.zkevm_l2_keystore_password}}"
create_geth_keystore "aggregator.keystore"      "{{.zkevm_l2_aggregator_private_key}}"      "{{.zkevm_l2_keystore_password}}"
create_geth_keystore "claimtxmanager.keystore"  "{{.zkevm_l2_claimtxmanager_private_key}}"  "{{.zkevm_l2_keystore_password}}"
create_geth_keystore "agglayer.keystore"        "{{.zkevm_l2_agglayer_private_key}}"        "{{.zkevm_l2_keystore_password}}"
create_geth_keystore "dac.keystore"             "{{.zkevm_l2_dac_private_key}}"             "{{.zkevm_l2_keystore_password}}"
create_geth_keystore "proofsigner.keystore"     "{{.zkevm_l2_proofsigner_private_key}}"     "{{.zkevm_l2_keystore_password}}"

    Replace the placeholder variables (e.g., {{.zkevm_l2_sequencer_private_key}}) with actual values before execution.
    The output keystore files are placed in the /opt/zkevm directory.

# Error Handling

    The script uses the set -e option to stop execution upon encountering any errors.
    Ensure that the output directory has sufficient permissions.
