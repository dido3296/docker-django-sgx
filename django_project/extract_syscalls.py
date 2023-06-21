unique_syscalls = set()

with open('strace_output.txt', 'r') as file:
    for line in file:
        syscall = line.split('(')[0]
        unique_syscalls.add(syscall)

with open('unique_syscalls.txt', 'w') as file:
    for syscall in unique_syscalls:
        file.write(syscall + '\n')