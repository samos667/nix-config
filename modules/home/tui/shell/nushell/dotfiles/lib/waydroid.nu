def droidrunv --env [] {

  waydroid session stop
  pueue add "waydroid session start"

  sleep 3sec

  waydroid prop set persist.waydroid.height 1400
  waydroid prop set persist.waydroid.width 788

  waydroid session stop
  pueue add "waydroid session start"
}
def droidrunh [] {

  waydroid session stop
  pueue add "waydroid session start"

  sleep 3sec

  waydroid prop set persist.waydroid.width 1920
  waydroid prop set persist.waydroid.height 1021


  waydroid session stop
  pueue add "waydroid session start"
}
alias sw = waydroid app launch com.com2us.smon.normal.freefull.google.kr.android.common

def swinit [] {
  droidrunh
  sleep 3sec
  sw
}
alias poke = waydroid app launch jp.pokemon.pokemontcgp

def pokeinit [] {
  droidrunv
  sleep 7sec
  poke
}
