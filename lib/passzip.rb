require "passzip/version"

module Passzip
  AvailableChars = [
#    "0", # o, O
#    "1", # l, I
#    "2", # z, Z
    "3",
    "4",
#    "5", # s, S
#    "6", # b
    "7",
    "8",
    "9",
    "a",
#    "b", # 6
    "c",
    "d",
    "e",
    "f",
#    "g", # q
    "h",
    "i",
    "j",
#    "k", # K
#    "l", # 1, I
    "m",
    "n",
#    "o", # 0, O
    "p",
#    "q", # g
    "r",
#    "s", # 5, S
    "t",
    "u",
    "v",
    "w",
    "x",
    "y",
#    "z", # 2, Z
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
#    "I", # 1, l
    "J",
#    "K", # k
    "L",
    "M",
    "N",
#    "O", # 0, o
    "P",
    "Q",
    "R",
#    "S", # 5, s
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
#    "Z", # 2, z
  ]

  def generate_password(length)
    (1..length).map {AvailableChars.sample}.join
  end

  def zipfile(filename, password)
    zipfilename = filename + ".zip"
    success = system("zip", "-P", password, zipfilename, filename)
    if success.nil? || !success
      raise "Failed to execute zip command."
    end
  end

  def passfile(filename, password)
    passfilename = filename + ".pass"
    File.open(passfilename, "w") do |file|
      file.puts password
    end
  end

  module_function :generate_password, :zipfile, :passfile
end
