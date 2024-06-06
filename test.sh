#!/usr/bin/env python3

import os

def test_and_log_all(func_list, param_list, dir_name):
    # creating a directory dir_name
    original_directory = os.getcwd()

    try: 
        os.mkdir(os.getcwd() + "/" + dir_name)
        os.chdir(dir_name)
        print("After creating directory:", os.getcwd())
    except OSError as error:
        print(error)

    # calling the functions and storing it in a txt file
    for i, f in enumerate(func_list):
        parameters = param_list[i]
        file_path = os.getcwd() + "/" + f.__name__ + ".txt"
        print("file path:", file_path)
        # if the function were to be stored in the dictionary, then you would be able to call it and make it callable as well
        content = f(*parameters)
        # if the txt does not exist
        if not os.path.isfile(file_path):
            with open(file_path, 'w') as file:
                file.write(content)
        else:
            # if the txt for respective file exists, then create a different one
            version = 2
            while os.path.isfile(file_path) :
                file_path = os.getcwd() + "/" + f.__name__ + str(version) + ".txt"
                version+=1
            with open(file_path, 'w') as file:
                file.write(content)

    # return back to the original directory for other tests
    os.chdir(original_directory)

def function1(*args):
    if not args:
        print("No arguments provided.")
        return
    print(args)
    first_param = args[0]
    second_param = args[1]
    return (f"First parameter: {first_param}, Second parameter: {second_param}")

def function2(*args):
    if not args:
        print("No arguments provided.")
        return
    print(args)
    first_param = args[0]
    second_param = args[1]
    third_param = args[2]
    return (f"First parameter: {first_param}, Second parameter: {second_param}, Third parameter: {third_param}")
 
def main():
    print("Starting the task")
    test1_func_list = [function1]
    test1_param_list = [["function1_1", "function1_2"]]
    test2_func_list = [function1, function2]
    test2_param_list = [["function1_1", "function1_2"],["function2_1", "function2_2", "function2_3"]]
    # print("About to enter the function")
    test_and_log_all(test1_func_list, test1_param_list, "test1")
    test_and_log_all(test2_func_list, test2_param_list, "test2")

if __name__ == '__main__':
    # Run the main function
    main()
    