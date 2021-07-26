class Plutus < Formula
  desc "plutus-cli from source"
  homepage "https://better.com"
  version "0.57.8"

  on_macos do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-darwin-x64.tar.gz"
    sha256 "cf1a74e0bcb786d1732519a800fc06b6b487196e443fc8ae18665b2898affb64"
  end
  
  on_linux do
    url "https://plutus-cli.s3.amazonaws.com/plutus-v#{version}/plutus-v#{version}-linux-x64.tar.gz"
    sha256 "0d47df5bf2d7c173857be4617abadca218eb89e4c21ba040e93e02b45b3dce05"
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
