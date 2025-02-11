{ buildGoModule, lib, fetchFromGitHub }:

buildGoModule rec {
  pname = "argo-rollouts";
  version = "1.4.0";

  src = fetchFromGitHub {
    owner = "argoproj";
    repo = "argo-rollouts";
    rev = "v${version}";
    sha256 = "sha256-HdYbrcz1uumwfUleDayc7obv4Grpg3TiUxKr8aF5bXM=";
  };

  vendorHash = "sha256-ZIFZCMyhpfKK/Irq2/MvkXuXX1jExDaSK/nXZgzCZgU=";

  # Disable tests since some test fail because of missing test data
  doCheck = false;

  subPackages = [ "cmd/rollouts-controller" "cmd/kubectl-argo-rollouts" ];

  meta = with lib; {
    description = "Kubernetes Progressive Delivery Controller";
    homepage = "https://github.com/argoproj/argo-rollouts/";
    license = licenses.asl20;
    maintainers = with maintainers; [ psibi ];
  };
}
