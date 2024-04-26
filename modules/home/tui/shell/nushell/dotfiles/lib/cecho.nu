def cecho [
  message: string
  --date(-d)
  --color(-c): string
  ] {
  if ($color | is-not-empty) {
    if $date {
      echo $'(ansi $color)(date now | format date "[%d-%m-%Y %Hh%M] :: ")($message)(ansi reset)'
    } else {
      echo $'(ansi $color)($message)(ansi reset)'
    }
  } else {
    echo $message
  }
}
