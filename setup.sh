bash
#!/bin/bash
set -e

echo "========== PRE-COMPILE SCRIPT START =========="
echo "User: $(whoami)"
echo "Tanggal: $(date)"
echo "Env var TEST_VAR: $TEST_VAR"
echo "Isi folder model:"
ls -la /opt/ml/model/code

# Upload log ke S3
LOG_FILE="/tmp/neo_compile_log.txt"
echo "Script jalan $(date)" > $LOG_FILE
aws s3 cp $LOG_FILE s3://bucket-kamu/neo-logs/$(date +%Y-%m-%d-%H-%M-%S).txt
echo "========== PRE-COMPILE SCRIPT END =========="
