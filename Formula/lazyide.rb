class Lazyide < Formula
  desc "Lightweight terminal-native IDE built with Rust and ratatui"
  homepage "https://github.com/TysonLabs/lazyide"
  version "0.3.87"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TysonLabs/lazyide/releases/download/v0.3.87/lazyide-macos-aarch64.tar.gz"
      sha256 "ccbe93fc44e7a767711db9c96c29e6362a750a891d12771d71505a9eed69b8ad"
    else
      url "https://github.com/TysonLabs/lazyide/releases/download/v0.3.87/lazyide-macos-x86_64.tar.gz"
      sha256 "70d6b4ebd9076112cf9fc482a3c50ee052c21b93ad26651e54ba490cf273e3c5"
    end
  end

  def install
    bin.install "lazyide"
  end

  def caveats
    <<~EOS
      Optional tools for full functionality:
        brew install ripgrep        # project-wide search (Ctrl+Shift+F)
        rustup component add rust-analyzer  # LSP for Rust files

      Run `lazyide --setup` to check and install missing tools.
    EOS
  end

  test do
    assert_match "Usage: lazyide", shell_output("#{bin}/lazyide --help")
  end
end
