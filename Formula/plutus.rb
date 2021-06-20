class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "0.53.1"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "4c3447e5abf4ce808dc361281aee2e79e39e7dd0f9048fd8ddcb7f3ac4a53f1b"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "0415160deb52005cbfd5c4c0eebd44aa68ebdae06e1ebc97339bda66e870a89c"
  end

  def install
    inreplace "bin/plutus", /^CLIENT_HOME=/, "export PLUTUS_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/plutus"
  end

  test do
    system bin/"plutus", "version"
  end
end
