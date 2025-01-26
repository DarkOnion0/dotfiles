{
  # Improve support for my XP-PEN Artist Pro Gen2
  #services.xserver.digimend.enable = true;
  services.xserver.inputClassSections = [
    ''
      Identifier "XP-Pen Artist Pro 16 (Gen2) Tablet"
      MatchUSBID "28bd:095b"
      MatchIsTablet "on"
      MatchDevicePath "/dev/input/event*"
      Driver "wacom"
    ''
    ''
      Identifier "XP-Pen Artist Pro 16 (Gen2) Tablet"
      MatchUSBID "28bd:095b"
      MatchIsTablet "on"
      MatchDevicePath "/dev/input/event*"
      Driver "libinput"
    ''
  ];
  services.input-remapper.enable = true;
  #services.udev.extraHwdb = ''
  #  evdev:input:b0003v28BDp0904e0100-e0*
  #    KEYBOARD_KEY_d0045=0x14c
  #'';
}
