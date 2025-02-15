require "language/node"

class Cdk8s < Formula
  desc "Define k8s native apps and abstractions using object-oriented programming"
  homepage "https://cdk8s.io/"
  url "https://registry.npmjs.org/cdk8s-cli/-/cdk8s-cli-1.0.103.tgz"
  sha256 "22ef6e98ad8da46b3963cfaef79f74de03383d5b7de6a9834a11cbfa213f6a69"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "709c8798897b4494ae2b41ef78d905ce9b648edaccd5c77b002700ccc8615ebd"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Cannot initialize a project in a non-empty directory",
      shell_output("#{bin}/cdk8s init python-app 2>&1", 1)
  end
end
