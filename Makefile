VENV = .venv
PYTHON = $(VENV)/bin/python
PIP = $(VENV)/bin/pip

SUCCESS = $(shell tput setaf 2 && tput bold)
ERROR = $(shell tput setaf 7 && tput setab 1 && tput bold)
INFO = $(shell tput setaf 4 && tput bold)
RESET = $(shell tput sgr0)

.PHONY: run clean

$(VENV)/bin/activate: requirements.txt
	python3 -m venv $(VENV)
	$(PIP) install -r requirements.txt
	@printf "$(SUCCESS)installed requirements ✓$(RESET)\n"

run: $(VENV)/bin/activate
	@printf "$(INFO)starting software...$(RESET)\n"
	$(PYTHON) src/app.py

clean:
	rm -rf __pycache__
	rm -rf $(VENV)
	@printf "$(SUCCESS)cleaning complete ✓$(RESET)\n"
