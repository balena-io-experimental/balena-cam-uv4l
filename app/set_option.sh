#!/bin/bash
set_option() {
    if [[ -z $1 || -z $2 || -z $3 ]]; then return; fi

    # Try to replace variable ($1) value with the new one ($2) in the file ($3).
    # Append variable to the file if it doesn't exist. Create file with the
    # variable set if the file doesn't exist.
    [[ -f "$3" ]] \
        && grep -q "^$1\s*=.*$" "$3" && sed -i "s+^$1\s*=.*$+$1 = $2+g" "$3" \
        || echo "$1 = $2" >> "$3"
}
