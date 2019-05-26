# Welcome!

This is is a small shell-script program to synchronize files througn SSH.

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

Add the following 3 lines into the `~/.bashrc` or `~/.bash_profile` file:

```sh
#SSH file-sync
alias ssync='~/.sshSync/sync.sh'	#sync begin
alias ssyncend='~/.sshSync/syncend.sh'	#sync end
alias ssync_smi='ps -ef|grep scp.sh|grep -v grep'	#States
alias ssync_pid='cat ~/.sshSync/.config/scpPID.txt'	#PID
```
then, input `source ~/.bashrc` or `source ~/.bash_profile` in the Terminal.

After that, you can just use Commands `ssync`, `ssyncend`, `ssync_smi` and `ssync_pid` in the Terminal to synchronize files through SSH.

## Thanks!

>2019.5.26 Shanghai
>
>WW
