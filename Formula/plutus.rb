class Plutus < Formula
  desc "plutus-cli"
  homepage "https://better.com"
  url "https://plutus-cli.s3.amazonaws.com/plutus-v0.25.5/plutus-v0.25.5-darwin-x64.tar.gz"
  sha256 "da0cf02fd68352516cb9b805c4650af68d18d96802e3cf9e4bcb55e31ed06121"

  def install
    inreplace "bin/plutus", /^CLIENT_HOME=/, "export PLUTUS_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/plutus"

    bash_completion.install "#{libexec}/node_modules/@plutus-cli/plugin-autocomplete/autocomplete/brew/bash"
    zsh_completion.install "#{libexec}/node_modules/@plutus-cli/plugin-autocomplete/autocomplete/brew/zsh/_plutus"
  end

  def caveats; <<~EOS
    To use the Plutus CLI's autocomplete --
      Via homebrew's shell completion:
        1) Follow homebrew's install instructions https://docs.brew.sh/Shell-Completion
            NOTE: For zsh, as the instructions mention, be sure compinit is autoloaded
                  and called, either explicitly or via a framework like oh-my-zsh.
        2) Then run
          $ plutus autocomplete --refresh-cache

      OR

      Use our standalone setup:
        1) Run and follow the install steps:
          $ plutus autocomplete
  EOS
  end

  test do
    system bin/"plutus", "version"
  end
end
