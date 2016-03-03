function pycd
    cd (python -c "import $argv[1]; import os; \
    print(os.path.dirname($argv[1].__file__))")
end
