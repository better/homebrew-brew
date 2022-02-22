class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "1.24.3"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "af6ac70d410bb8630bdba7326c7ae7fbea5bcd414ca6206b66ff6edeae65abc0"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "9648e4c5570cb5f54fa79d7a20353f17dc98b9bfacd9b342f26e71c909045e2f"
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
