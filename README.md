# Welcome!

[toc]

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
to initialize the `targetDir.txt` file in case the `cd: no such file or directory` error problems ( `~/XXX/XXX` must be absolute path starting from the root directory ).

## Second
Add the following codes into the `~/.bashrc` or `~/.bash_profile` file:

```sh
# SSH file-Sync
#setting
ssyncsetssh()
{
	echo $1 > ~/.sshSync/ssh.txt;
	echo Set SSH as: $1;
}
alias ssync-set-ssh=ssyncsetssh

ssyncsettime()
{
	echo $1 > ~/.sshSync/syncTime.txt;
	echo Set sync-time interval as: $1s;
}
alias ssync-set-time=ssyncsettime

ssyncsettarget()
{
	echo $1 > ~/.sshSync/targetDir.txt;
	echo Set target as: $1;
}
alias ssync-set-target=ssyncsettarget

alias ssync='~/.sshSync/sync.sh'	#sync begin
alias ssyncend='~/.sshSync/syncEnd.sh'	#sync end
alias ssync-smi='echo ----------------------------------------------------------------------------- && echo "*** SYNC-INFORMATION ***" && echo ----------------------------------------------------------------------------- && echo -n "SSH:                  " && cat ~/.sshSync/ssh.txt && echo -n "Sync-Time Interval:   " && echo -n `cat ~/.sshSync/syncTime.txt` && echo s && echo -n "Target Path:          " && cat ~/.sshSync/targetDir.txt && echo && echo ============================================================================= && echo "  UID   PID  PPID   C STIME   TTY           TIME CMD" && echo ============================================================================= && ps -ef|grep scp.sh|grep -v grep && echo ============================================================================='	#States
alias ssync-pid='echo -n PID:" "[  && echo -n `cat ~/.sshSync/.config/scpPID.txt` && echo ]'	#PID
```
>Note: you can adjust the blank space of the `echo "..."` in the 26th line to accommodate your system. (MacOS or Linux)

then, input `source ~/.bashrc` or `source ~/.bash_profile` in the Terminal.

After that, you can just use Commands `ssync-set-ssh`,`ssync-set-time` and `ssync-set-target` to initialize, and use Commands `ssync`, `ssyncend`, `ssync-smi` and `ssync-pid` in the Terminal to synchronize files through SSH.

## Thanks!

>2019.5.27 Shanghai
>
>WW
