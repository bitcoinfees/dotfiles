function py3cd
    cd (python3 -c "import $argv[1]; import os; \
        print(os.path.dirname($argv[1].__file__))")
end
