Field Descriptions for permissionless-node
# Executors and Aggregators

    runExecutorServer: Boolean indicating whether to run the executor server.
    runExecutorClient: Boolean indicating whether to run the executor client.
    runExecutorClientMultithread: Boolean indicating if the client should use multithreading.
    runAggregatorServer: Boolean indicating if the aggregator server should run.
    runAggregatorClient: Boolean indicating if the aggregator client should run.
    runAggregatorClientMock: Boolean indicating if a mock version of the aggregator client should run.

Cryptographic Tests and Scripts

    runKeccakScriptGenerator: Runs the script generator for Keccak hashing.
    runKeccakTest: Runs the Keccak cryptographic test.

Database Configuration

    databaseURL: URL for the database connection using PostgreSQL.
    dbNodesTableName: Table name for state nodes.
    dbProgramTableName: Table name for state programs.
    dbMultiWrite: Allows multiple writes simultaneously.

Input and Output

    inputFile: Input file path for executor data.
    outputPath: Directory path to store output data.

Parallel Execution

    executeInParallel: Enables parallel execution of tasks.
    maxExecutorThreads: Maximum threads for the executor.
    maxProverThreads: Maximum threads for the prover.

Prover Configuration

    proverName: Name of the prover used in the zkEVM environment.
    proverServerPort: Port used by the prover server.

Miscellaneous

    cleanerPollingPeriod: Interval in seconds to poll for cleanup tasks.
    requestsPersistence: Time in seconds for which requests persist.

