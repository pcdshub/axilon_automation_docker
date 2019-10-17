FROM perl:5.30

LABEL maintainer="K Lauer <klauer@slac.stanford.edu>"
USER root

WORKDIR /axilon
# RUN git clone https://github.com/slaclab/axilon_mirror_automation.git device-uut
COPY axilon_mirror_automation/ /axilon/device-uut/

RUN cpan -f -i IPC::Run
RUN cpan -f -i JSON
RUN cpan -f -i Moose
RUN cpan -f -i MooseX::Params::Validate
RUN cpan -f -i namespace::autoclean
RUN cpan -f -i Term::ProgressBar
RUN cpan -f -i Class::MethodMaker
RUN cpan -f -i Module::Runtime

ENV PERL5LIB /axilon/device-uut/lib:perl5/lib/perl5/:perl5/lib/perl5/x86_64-linux-thread-multi

RUN perldoc device-uut/lib/Device/UUT.pm
ENTRYPOINT ["perl", "/axilon/device-uut/bin/uut-pv" ]
