class Plutus < Formula
  desc "plutus-cli"
  homepage "https://better.com"
  url "https://plutus-cli.s3.amazonaws.com/plutus-v0.25.5/plutus-v0.25.5-darwin-x64.tar.gz"
  sha256 "da0cf02fd68352516cb9b805c4650af68d18d96802e3cf9e4bcb55e31ed06121"

  def install
    inreplace "bin/plutus", /^CLIENT_HOME=/, "export PLUTUS_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/plutus"
  end

  def caveats; <<~EOS
    To use the Plutus CLI's autocomplete --
      Use our standalone setup:
        1) Run and follow the install steps:
          $ plutus autocomplete
  EOS
  end

  test do
    system bin/"plutus", "version"
  end
end
