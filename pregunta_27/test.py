import fileinput
import glob
import os
from os.path import dirname

module_path = dirname(__file__)
os.chdir(module_path)


expected = [
    "3",
    "-1",
    "-1",
    "-1",
    "-1",
    "-1",
    "-1",
    "-1",
    "-1",
    "-1",
    "-1",
    "-1",
    "3",
    "-1",
    "-1",
    "-1",
    "-1",
    "-1",
]

if os.path.isdir("output"):
    os.system("rm -rf output")

os.system("docker run -v $PWD:/workspace jdvelasq/pig:classroom")

assert os.path.isdir("output") is True

result = []
with fileinput.input(files=glob.glob("output/*")) as f:
    for line in f:
        line = line.replace("\n", "")
        result.append(line)

for expected_line, result_line in zip(expected, result):
    assert (
        expected_line == result_line
    ), f"Expected: {expected_line}\nGot: {result_line}"
