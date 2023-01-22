#!/bin/sh
# Different people use interactive panels,
# protect them from accidental leaks of logins etc.
export CHROMIUM_USER_FLAGS="--incognito
