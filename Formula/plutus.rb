class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "0.53.5"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "1ddad475fcd6b281bcd03fc5d2f82bb88a4317cf1257f87545a915e1c0b11426"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "7edf8707d74b831effa23d74ccc00a39bb3afc5750502569ee0dbd8e33b3f177"
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
