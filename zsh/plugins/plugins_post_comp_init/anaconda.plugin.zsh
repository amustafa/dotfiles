################################
# Anaconda


if [ -d $ANACONDA_ROOT ]; then
    if [ -z ${AM_ANACONDA_ADD_TO_PATH+x} ]; then 
        export PATH=$PATH:$HOME/opt/anaconda3/bin
    fi
fi


# added by Anaconda3 5.3.0 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$(CONDA_REPORT_ERRORS=false '/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    \eval "$__conda_setup"
#else
#    if [ -f "/anaconda3/etc/profile.d/conda.sh" ]; then
#        . "/anaconda3/etc/profile.d/conda.sh"
#        CONDA_CHANGEPS1=false conda activate base
#    else
#        \export PATH="/anaconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda init <<<
#########################################
