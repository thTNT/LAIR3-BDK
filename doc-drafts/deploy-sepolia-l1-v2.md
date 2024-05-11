# Deploying Kurtosis CDK with Sepolia as L1

This guide outlines the steps necessary to configure and deploy the Kurtosis CDK using Sepolia as the Layer 1 (L1) environment. Sepolia is used for testing Ethereum 2.0 features and provides a more stable testnet experience.

## Configuration Adjustments

### Update L1-Related Parameters

To deploy to Sepolia, specific L1-related parameters in the `params.yml` file must be adjusted. Follow these steps:

1. **Disable Local L1 Deployment**:
   - Set `deploy_l1` to `false` to use Sepolia's existing infrastructure instead of deploying a local L1 node.
   ```yaml
   deploy_l1: false

# update Sepolia-Specific Settings:

    Modify the following parameters according to your needs and the specifics of the Sepolia network:

l1_chain_id: 11155111
l1_preallocated_mnemonic: <mnemonic_for_a_funded_L1_account>
l1_funding_amount: 1ether
l1_rpc_url: <Sepolia_RPC_URL>
l1_ws_url: <Sepolia_WS_URL>

        Ensure that the first account derived from the mnemonic has sufficient funds to cover deployment costs and initial funding transfers to key L1 addresses (e.g., Sequencer, Aggregator).

# Adjust Service Configurations

In the cdk_bridge_infra.star file, comment out the references to the local L1 RPC service as follows:

...
# l1rpc_service = plan.get_service("el-1-geth-lighthouse")
...
# "l1rpc_ip": l1rpc_service.ip_address,
# "l1rpc_port": l1rpc_service.ports["rpc"].number,

Update HAProxy Configuration

Modify the haproxy.cfg file within the templates/bridge-infra directory to prevent routing to the local L1 node. Comment out or remove the following sections:

...
    # acl url_l1rpc path_beg /l1rpc
...
    # use_backend backend_l1rpc if url_l1rpc
...
# backend backend_l1rpc
#     http-request set-path /
#     server server1 {{.l1rpc_ip}}:{{.l1rpc_port}}


Deployment Process

After updating the configurations:

    Initialize Deployment:
        Run any initialization scripts or commands required by Kurtosis to set up the CDK environment.

    Verify Configuration:
        Ensure that all services and configurations are correctly set up to communicate with the Sepolia network.

    Launch Services:
        Deploy the Kurtosis CDK services. Monitor the logs to ensure that all components are functioning correctly and interacting with the Sepolia network as expected.

By following these steps, you can deploy the Kurtosis CDK with Sepolia as L1, leveraging an external testnet environment for development and testing. Ensure that any sensitive information, such as mnemonics, is securely managed and not exposed in public repositories or unsecured files.


