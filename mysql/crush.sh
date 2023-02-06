# Load environment variables from .env file
#!/bin/bash
source .env

#run both scripts
./fetchRemote.sh
./overwiteLocal.sh