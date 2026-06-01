import os
import sys
import subprocess

print("[NEO-LOG] inference.py jalan", file=sys.stderr)

# Jalanin setup.sh
script_path = "/opt/ml/model/code/setup.sh"
print(f"[NEO-LOG] Jalanin {script_path}", file=sys.stderr)

try:
    result = subprocess.run(
        ['bash', script_path], 
        check=True, 
        capture_output=True, 
        text=True, 
        env=os.environ
    )
    print(f"[NEO-LOG] Output script:\n{result.stdout}", file=sys.stderr)
except subprocess.CalledProcessError as e:
    print(f"[NEO-LOG] Script error: {e.stderr}", file=sys.stderr)

# Fungsi wajib
def model_fn(model_dir):
    return None

def input_fn(data, content_type):
    return data

def predict_fn(data, model):
    return data

def output_fn(pred, accept):
    return pred
