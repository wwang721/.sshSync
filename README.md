# Welcome!

This is is a small shell-script program to synchronize files througn SSH.

>Note: before using this small program, you have to use: 
>`ssh-keygen -t rsa` 
>to generate the public key for SSH, and copy the `.ssh/id_rsa.pub` into the remote SSH server: `~/.ssh/authorized_keys`, then `chmod 700` the key-file, so that you don't need to enter your password everytime when you are using your SSH connection.

## First
You have to pull the `.sshSync` fold into the root directory `~`.

You can edit the 3 files in the fold:

1. `ssh.txt`: SSH Address, e.g.`192.168.1.22`.
2. `syncTime.txt`: Time interval(Unit: Second) between every two synchronizations.
3. `targetDir.txt`: The files to synchronize.

Note: sometimes you need to use:

``` sh
echo ~/XXX/XXX > ~/.sshSync/targetDir.txt
```
to initialize the `targetDir.txt` file in case the `cd: no such file or directory` error problems.

## Second
Add the following 5 lines into the `~/.bashrc` or `~/.bash_profile` file:

```sh
#SSH file-sync
alias ssync='~/.sshSync/sync.sh'	#sync begin
alias ssyncend='~/.sshSync/syncend.sh'	#sync end
alias ssync_smi='echo "  UID   PID  PPID   C STIME   TTY           TIME CMD" && echo ============================================================================= && ps -ef|grep scp.sh|grep -v grep'	#States
alias ssync_pid='echo -n PID:" "[  && echo -n `cat ~/.sshSync/.config/scpPID.txt` && echo ]'	#PID
```
then, input `source ~/.bashrc` or `source ~/.bash_profile` in the Terminal.

After that, you can just use Commands `ssync`, `ssyncend`, `ssync_smi` and `ssync_pid` in the Terminal to synchronize files through SSH.

## Thanks!

>2019.5.26 Shanghai
>
>WW
