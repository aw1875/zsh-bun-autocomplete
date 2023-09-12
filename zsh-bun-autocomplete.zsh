BUN_AUTO_COMP_PATH="$(dirname $0)/zsh-bun-autocomplete"

_get_completions() {
    local completions=$($BUN_AUTO_COMP_PATH $@)
    local comp=(${=completions})
    compadd -- $comp
}

_bun() {
    if [ -z ${words[2]} ]; then
        _get_completions
        return
    fi

    case $words[2] in
        add)
            _get_completions add ${words[3]}
            ;;
        run)
            _get_completions run
            ;;
        remove)
            _get_completions remove
            ;;
        update)
            _get_completions update
            ;;
        *)
            _get_completions
            ;;
    esac
}

compdef _bun bun
