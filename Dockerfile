FROM fedora:27
CMD ["pypi"]
ENTRYPOINT ["thoth-solver"]
ENV \
 LANG=en_US.UTF-8 \
 THOTH_SOLVER_TMP_DIR='/tmp/thoth-solver-install'

RUN \
 dnf update -y &&\
 mkdir -p ${THOTH_SOLVER_TMP_DIR}

# Install thoth-solver itself
COPY ./ ${THOTH_SOLVER_TMP_DIR}
RUN \
 cd ${THOTH_SOLVER_TMP_DIR} &&\
 pip3 install . &&\
 cd / &&\
 rm -rf ${THOTH_SOLVER_TMP_DIR} &&\
 unset THOTH_SOLVER_TMP_DIR &&\
 dnf clean all
