class Lazyide < Formula
  desc "Lightweight terminal-native IDE built with Rust and ratatui"
  homepage "https://github.com/tgeorge06/lazyide"
  version "0.2.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tgeorge06/lazyide/releases/download/v0.2.4/lazyide-macos-aarch64.tar.gz"
      sha256 "001be82febcb5627796ec5b326164a916b98a806e62f4d375d06d11f15c2a287"
    else
      url "https://github.com/tgeorge06/lazyide/releases/download/v0.2.4/lazyide-macos-x86_64.tar.gz"
      sha256 "05d0ba0c51f869c2c58125728ea85abc7372e6bc761acf250373eed8b77992aa"
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
