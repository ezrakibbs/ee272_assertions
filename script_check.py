with open("session_log.txt", "r") as file:
    line = file.readline()
    index = 1
    array = []

    total_errors = 0
    caught_errors = 0
    notcaught_errors = 0

    while line != "":
        line = file.readline()
        index += 1
        if "----------- bugged" in line:
            total_errors = total_errors + 1
            line = file.readline()
            line = file.readline()
            line = file.readline()
            if "ERROR" in line:
                caught_errors = caught_errors + 1
            else:
                notcaught_errors = notcaught_errors + 1
                array.append(index)
            index += 3



print("Total Errors: ", total_errors)
print("Caught Errors: ", caught_errors)
print("Not Caught Errors: ", notcaught_errors)
print(array)
