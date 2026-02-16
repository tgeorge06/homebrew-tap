class Lazyide < Formula
  desc "Lightweight terminal-native IDE built with Rust and ratatui"
  homepage "https://github.com/tgeorge06/lazyide"
  version "0.3.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tgeorge06/lazyide/releases/download/v0.3.3/lazyide-macos-aarch64.tar.gz"
      sha256 "403a7949d9a680d0d6cad8d5ca36e103e9c0c3209a513a27100a17b9893a9333"
    else
      url "https://github.com/tgeorge06/lazyide/releases/download/v0.3.3/lazyide-macos-x86_64.tar.gz"
      sha256 "ebf2e7daf9b9da30d88b2bfb43ef248e0d2b6e960b4e32e76360ff7ef53bb07b"
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
